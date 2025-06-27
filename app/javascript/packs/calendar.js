import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';

document.addEventListener('turbolinks:load', function() {
  console.log('loaded');
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin, listPlugin],
    initialView: 'dayGridMonth',
    selectable: true,
    locale: "jp",
    events: 'event',

    eventClick: function(info) {
      var eventId = info.event.id;
      window.location.href = '/events/' + eventId ;
    }
  });


  calendar.render();
});