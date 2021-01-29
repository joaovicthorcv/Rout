import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
import '@fullcalendar/common/main.css';
import '@fullcalendar/daygrid/main.css';
import '@fullcalendar/timegrid/main.css';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin ],
    initialView: 'timeGridWeek',
    headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay, listWeek'
    },
    navLinks: true,
    
    selectable: true,
    editable: true,
    events: '/activities.json',

    select: function(start, end) {
        $.getScript('/activities/new', function() {});

        calendar.unselect()
      },

      eventDrop: function({event, delta, revertFunc}) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function({event, jsEvent, view}) {
        $.getScript(event.edit_url, function() {});
      }

  });

  calendar.render();
});




//= require fullcalendar
// var initialize_calendar;

// initialize_calendar = function() {
//     console.log("test again")
//     $('.calendar').each(function(){
//         var calendar = $(this);
//         console.log(calendar);
//         calendar.Calendar({
//             header: {
//                 left: 'prev,next today',
//                 center: 'title',
//                 right: 'month,agendaWeek,agendaDay'
//             },
//             selectable: true,
//             selectHelper: true,
//             editable: true,
//             eventLimit: true,
//             events: '/activities.json',

//             select: function(start, end) {
//                 $.getScript('/activities/new', function() {});
        
//                 calendar.fullCalendar('unselect');
//               },
        
//               eventDrop: function(event, delta, revertFunc) {
//                 event_data = { 
//                   event: {
//                     id: event.id,
//                     start: event.start.format(),
//                     end: event.end.format()
//                   }
//                 };
//                 $.ajax({
//                     url: event.update_url,
//                     data: event_data,
//                     type: 'PATCH'
//                 });
//               },
              
//               eventClick: function(event, jsEvent, view) {
//                 $.getScript(event.edit_url, function() {});
//               }
//         });
//     })
// };
// $(document).ready(initialize_calendar)