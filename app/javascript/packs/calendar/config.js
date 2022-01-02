import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

const calendarEl = document.getElementById("calendar");

const calendar = new Calendar(calendarEl, {
  plugins: [dayGridPlugin, interactionPlugin],
  locale: "ja",
  timeZone: "Asia/Tokyo",
  firstDay: 1,
  headerToolbar: {
    start: '',
    center: 'title',
    end: 'today prev,next'
  },
});