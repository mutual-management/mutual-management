import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

const calendarEl = document.getElementById("calendar");

const calendar = new Calendar(calendarEl, {
  plugins: [dayGridPlugin, interactionPlugin],
  timeZone: "Asia/Tokyo",
  firstDay: 1,
  headerToolbar: {
    start: 'prev',
    center: 'title',
    end: 'today next'
  },
  dateClick: function() {
    console.log("日付クリック");
  }
});

calendar.render();