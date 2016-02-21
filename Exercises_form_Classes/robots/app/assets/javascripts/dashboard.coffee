$(document).ready ->
  if window.location.pathname == '/'
    labels = []
    dataPoints = []
    $.ajax '/inventors_hired',
      type: 'GET'
      success: (data) ->
        labels = Object.keys(data.records)
        for key of data.records
          dataPoints.push(data.records[key])
        data = {
          labels: labels
          datasets: [
            {
              label: "My first dataset",
              fillColor: "rgba(220,220,220,0.2)",
              strokeColor: "rgba(220,220,220,1)",
              pointColor: "rgba(220,220,220,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: dataPoints
            }
          ]
        }
        options = { responsive: true, scaleShowGridLines: false, pointDotRadius: 3, bezierCurveTension: .3 }
        $('#inventors_hired').empty()
        new Chart($('#inventors_hired').get(0).getContext('2d')).Line(data, options)
  #Polar area chart
  industryData = []
  $.ajax '/by_industry',
    type: 'GET'
    success: (data) ->
      for type, count of data.robots
        switch type
          when 'Service' then set = {value: count, color: "#517EA6", highlight: 'rgba(81, 126, 166, .1)', label: type}
          when 'War' then set = {value: count, color: "#AB2116", highlight: 'rgba(81, 126, 166, .1)', label: type}
          when 'Technician' then set = {value: count, color: "#5A6B75", highlight: 'rgba(81, 126, 166, .1)', label: type}
          when 'Education' then set = {value: count, color: "#BC774C", highlight: 'rgba(81, 126, 166, .1)', label: type}
          when 'Science' then set = {value: count, color: "#FDB45C", highlight: 'rgba(81, 126, 166, .1)', label: type}
        industryData.push(set)
      $('#robot_by_industry').empty()
      new Chart($("#robots_by_industry").get(0).getContext("2d")).PolarArea(industryData)


