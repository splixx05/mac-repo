#-----------------------------------------------------------------------#
#																		#
# Battery Pro for Übersicht 											#
# 																		#
# Created July 2018 by Mike Pennella (github.com/mpen01/battery_pro)	#
#																		#
#-----------------------------------------------------------------------#

# Default values
labelColor = 'WHITE'
opacityLevel = '1'
lineColor = '#00BFFF'  # Default value for lineColor
bkground = 'rgba(#000, 0.5)'  # Default background color

# THEME & STYLE OPTIONS
theme = 'color'  # mono, paper, color or dark (default is color)
style = 'full'   # mini or full (default is full)

# LOW POWER THRESHOLD
lowPower = 20  # Battery indicators turn red if below this number

# POSITION WIDGET ON SCREEN
pos_top = '95px'
pos_left = '290px'

# Theme handling
if theme == 'mono' || theme == 'dark'
  statusColor = 'WHITE'
  chargingColor = 'WHITE'
  dischargeColor = 'WHITE'
  lowPowerColor = 'WHITE'
  lineColor = 'WHITE'
  bkground = 'rgba(#000, 0.0)'

else if theme == 'paper'
  statusColor = 'BLACK'
  chargingColor = 'BLACK'
  dischargeColor = 'BLACK'
  lowPowerColor = 'BLACK'
  lineColor = 'WHITE'
  bkground = 'rgba(#fff, 1)'

else
  statusColor = '#D3D3D3'   # Grey
  chargingColor = '#7dff7d'  # Bright Green
  dischargeColor = 'WHITE'
  lowPowerColor = '#FF0000'  # Red
  lineColor = '#00BFFF'       # Blue
  bkground = 'rgba(#000, 0.5)'

if theme == 'dark'
  bkground = 'rgba(#000000)'
  lineColor = 'rgba(#000000, 0.8)'
  opacityLevel = '0.6'

if style == 'mini'
  labelColor = 'rgba(#000, 0.0)' 
  statusColor = 'rgba(#000, 0.0)'  
  lineColor = 'rgba(#000, 0.0)' 
  bkground = 'rgba(#000, 0.0)'

command: "pmset -g batt | grep -o '[0-9]*%; [a-z]*'"
{ exec } = require('child_process')

# Refresh the widget every 10 seconds
refreshFrequency: 10000

style: """
  top: #{pos_top}
  left: #{pos_left}
  font-family: Avenir Next

  div
    display: block
    border: 1px solid #{lineColor}
    border-radius 5px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 16px
    font-weight: 400
    opacity: #{opacityLevel}
    padding: 4px 8px 4px 6px

    &:after
      content: 'BATTERY'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
  
  .percent
    font-size: 18px
    font-weight: 500
    margin: 0
    
  img
    height: 20px
    width: 20px
    margin-bottom: -3px
	
  .status
    padding: 0
    margin: 0
    margin-top: -2px
    margin-left: 5px
    font-size: 12px
    font-weight: 400
    max-width: 100%
    color: #{statusColor}
    text-overflow: ellipsis
    text-shadow: none
"""

render: -> """
  <div><img id="batt_icon" src=fullCharge>
  <a class='percent'></a><p class='status'></p></div>
"""

update: (output, domEl) ->
  values = output.split(";")
  percent = values[0]
  status = values[1].trim()
  div = $(domEl)

  # Abfrage des Bluetooth-Batteriestatus
  exec("blueutil --info C7:2B:51:21:48:DD", (error, stdout, stderr) ->
    if error
      console.error("Error fetching Bluetooth battery status: #{stderr}")
      return
    
    # Hier den stdout analysieren, um die Batterie-Info zu extrahieren
    batteryInfo = stdout.trim()
    values = batteryInfo.split(": ")
    
    if values.length > 1
      percent = values[1].trim()
      status = values[0].toLowerCase()

    # Update der Anzeige
    if status == "discharging" && +(percent.substring(0, percent.length - 1)) <= lowPower
      div.find('.percent').html(percent.fontcolor(lowPowerColor)) 
      status = 'plug in soon'
      document.getElementById("batt_icon").src = lowCharge
    
    else if status == "discharging"
      div.find('.percent').html(percent.fontcolor(dischargeColor)) 
      if +(percent.substring(0, percent.length - 1)) >= 90
        document.getElementById("batt_icon").src = fullCharge
      else if +(percent.substring(0, percent.length - 1)) > 60
        document.getElementById("batt_icon").src = almostFullCharge
      else if +(percent.substring(0, percent.length - 1)) > 20
        document.getElementById("batt_icon").src = halfCharged
    
    else if status == "charging" || status == "finishing"
      document.getElementById("batt_icon").src = batteryCharging
      div.find('.percent').html(percent.fontcolor(chargingColor)) 
    
    else if status == "charged"
      document.getElementById("batt_icon").src = batteryCharged
      div.find('.percent').html(percent.fontcolor(chargingColor))
      
    else
      div.find('.percent').html(percent.fontcolor(chargingColor))
      document.getElementById("batt_icon").src = batteryCharging
      status = 'AC attached'
      
    div.find('.status').html(status)
  )
