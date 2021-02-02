import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
import '@fullcalendar/common/main.css';
import '@fullcalendar/daygrid/main.css';
import '@fullcalendar/timegrid/main.css';

import 'bootstrap/dist/css/bootstrap.css';
import '@fortawesome/fontawesome-free/css/all.css'; // needs additional webpack config!
import bootstrapPlugin from '@fullcalendar/bootstrap';
import allLocales from '@fullcalendar/core/locales-all'

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  
  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin, bootstrapPlugin ],
    initialView: $(window).width() < 765 ? 'list':'timeGridWeek',
    themeSystem: 'bootstrap',
    height: 750,
    locales: allLocales,
    locale: 'pt-br',
    headerToolbar: {
        left: 'prev,next,today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
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
  if ($(window).width() < 765) {
    $('.btn-group').addClass('btn-group-sm')
    $('.btn').addClass('btn-sm')
    $('#calendar').width('100%')
    $('.fc-toolbar-title').css('font-size','1.25em')
  } 
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