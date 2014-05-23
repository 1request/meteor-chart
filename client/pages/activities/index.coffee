getHourlyData = (timestamp) ->
  data = []
  [0..23].map (i) ->
    date = new Date(timestamp)
    currentHour = date.setTime(date.setHours i, 0, 0, 0)
    nextHour = date.setTime(date.setHours i + 1, 0, 0, 0)
    count = Activities.find(time: {$gt: currentHour, $lt: nextHour}).count()
    data.push [i, count]
  data

lineCharts = (data, tick) ->
  lineChart = $.plotAnimator $('#graph-visits-lines'), data,
    xaxis:
      tickLength: 0
      tickDecimals: 0
      min: 0
      ticks: tick
      font:
        lineHeight: 12
        weight: "bold"
        family: "Open sans"
        color: "#8D8D8D"
    yaxis:
      ticks: 5
      tickDecimals: 0
      tickColor: "#f3f3f3"
      font:
        lineHeight: 13
        weight: "bold"
        family: "Open sans"
        color: "#8D8D8D"
    grid:
      backgroundColor:
        colors: ["#fff", "#fff"]
      borderColor: "transparent"
      margin: 0
      minBorderMargin: 0
      labelMargin: 15
      hoverable: true
      clickable: true
      mouseActiveRadius: 4
    legend:
      show: false

renderHourlyRate = (timestamp) ->
  data = getHourlyData(timestamp)
  graph_lines = [{
    label: "Line 1"
    data: data
    lines:
      lineWidth: 2
    shadowSize: 0
    color: '#3598DB'
  }, {
    label: "Line 1"
    data: data
    points:
      show: true
      fill: true
      radius: 6
      fillColor: "#3598DB"
      lineWidth: 3
    color: '#fff'
  }]
  hourlyTick = [
    [0, '0:00']
    [1, '01:00']
    [2, '02:00']
    [3, '03:00']
    [4, '04:00']
    [5, '05:00']
    [6, '06:00']
    [7, '07:00']
    [8, '08:00']
    [9, '09:00']
    [10, '10:00']
    [11, '11:00']
    [12, '12:00']
    [13, '13:00']
    [14, '14:00']
    [15, '15:00']
    [16, '16:00']
    [17, '17:00']
    [18, '18:00']
    [19, '19:00']
    [20, '20:00']
    [21, '21:00']
    [22, '22:00']
    [23, '23:00']
  ]
  lineCharts(graph_lines, hourlyTick)


Template.activities.rendered = ->
  $input = $('#date').pickadate
    onSet: (e) ->
      console.log 'e', e
      Session.set 'selectedTimestamp', e.select
  picker = $input.pickadate 'picker'
  picker.set 'select', new Date()

  Deps.autorun ->
    console.log Activities.find().count()
    if Session.get 'selectedTimestamp'
      renderHourlyRate Session.get 'selectedTimestamp'

  # graph_bars = [{
  #   data: d1
  #   color: '#3598DB'
  # }]

  # barCharts = ->
  #   bar_chart = $.plotAnimator $('#graph-bars'), graph_bars,
  #     series:
  #       bars:
  #         show: true
  #         barWidth: .9
  #         align: 'center'
  #       shadowSize: 0
  #     xaxis:
  #       tickColor: 'transparent'
  #       ticks: [
  #         [0, 'Jan'], [1, 'Fev'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sept'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']
  #       ]
  #       font:
  #         lineHeight: 12
  #         weight: "bold"
  #         family: "Open sans"
  #         color: "#9a9a9a"
  #     yaxis:
  #       ticks: 3,
  #       tickDecimals: 0,
  #       tickColor: "#f3f3f3",
  #       font:
  #         lineHeight: 13,
  #         weight: "bold",
  #         family: "Open sans",
  #         color: "#9a9a9a"
  #     grid:
  #       backgroundColor:
  #         colors: ["#fff", "#fff"]
  #       borderColor: "transparent"
  #       margin: 0
  #       minBorderMargin: 0
  #       labelMargin: 15
  #       hoverable: true
  #       clickable: true
  #       mouseActiveRadius: 4
  #     legend:
  #       show: false

  # $("#graph-lines").on "animatorComplete", ->
  #   $("#lines, #bars").removeAttr("disabled")

  # $("#lines").on "click", ->
  #   $('#bars').removeClass 'active'
  #   $('#graph-bars').fadeOut()
  #   $(this).addClass 'active'
  #   $("#lines, #bars").attr("disabled", "disabled")
  #   $('#graph-lines').fadeIn()
  #   lineCharts()

  # $("#graph-bars").on "animatorComplete", ->
  #   $("#bars, #lines").removeAttr("disabled")

  # $("#bars").on "click", ->
  #   $("#bars, #lines").attr("disabled", "disabled")
  #   $('#lines').removeClass('active')
  #   $('#graph-lines').fadeOut()
  #   $(this).addClass('active')
  #   $('#graph-bars').fadeIn().removeClass('hidden')
  #   barCharts()

  # $('#graph-bars').hide()

  # showTooltip = (x, y, contents) ->
  #   $('<div id="flot-tooltip">' + contents + '</div>').css(
  #     position: 'absolute'
  #     display: 'none'
  #     top: y + 5
  #     left: x + 5
  #     color: '#fff'
  #     padding: '2px 5px'
  #     'background-color': '#717171'
  #     opacity: 0.80
  #   ).appendTo("body").fadeIn(200)

  # $("#graph-lines, #graph-bars").bind "plothover", (event, pos, item) ->
  #   $("#x").text pos.x.toFixed(0)
  #   $("#y").text pos.y.toFixed(0)
  #   if item
  #     if previousPoint != item.dataIndex
  #       previousPoint = item.dataIndex
  #       $("#flot-tooltip").remove()
  #       x = item.datapoint[0].toFixed(0)
  #       y = item.datapoint[1].toFixed(0)
  #       showTooltip(item.pageX, item.pageY, y + " visitors")
  #   else
  #     $("#flot-tooltip").remove()
  #     previousPoint = null

