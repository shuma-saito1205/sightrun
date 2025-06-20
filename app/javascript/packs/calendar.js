import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin, listPlugin],
    initialView: 'dayGridMonth',
    selectable: true,
    locale: "jp",
    events: eventData
  });

  var event = calendar.getEventById('1')
  calendar.render();
});