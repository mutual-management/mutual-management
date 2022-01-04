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
  dateClick: function(targetDate) {
    focusOnDate(targetDate);
  }
});

calendar.render();

function focusOnDate(date) {
  $(".target-date").removeClass("target-date");
  date.dayEl.classList.add("target-date");
  console.log("日付クリック");

  const dateVal = date.dateStr
  $.ajax({
    url: `/calendar/${dateVal}`,
    type: 'GET',
    dataType: 'html',
    async: true,
    data: {
      targetDate: dateVal
    },
  }).done(function (res) {
    console.log(res);
  });
};