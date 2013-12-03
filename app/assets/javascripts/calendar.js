// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  var select = function(start, end, allDay) {
    var title = window.prompt("title");
    var data = {event: {title: title,
      start: start,
      end: end, 
      allDay: allDay}};
      $.ajax({
	type: "POST",
	url: "/todolists",
	data: data,
	success: function() {
	  calendar.fullCalendar('refetchEvents');
	}
      });
      calendar.fullCalendar('unselect');
  };

  var calendar = $('#calendar').fullCalendar({
    events: '/todolists.json',
    selectable: true,
    selectHelper: true,
    ignoreTimezone: false,
    select: select
  });
});
