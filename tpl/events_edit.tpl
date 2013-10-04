    <link rel="stylesheet" type="text/css" media="screen" href="/assets/pikaday/pikaday.css">
    <script type="text/javascript" src="/assets/moment/moment.min.js"> </script>
    <script type="text/javascript" src="/assets/pikaday/pikaday.js"> </script>
    <link href="/assets/select2/select2.css" rel="stylesheet"/>
    <script src="/assets/select2/select2.js"></script>

<div class="hero-unit">
<h3>Edit an event</h3>
    <form action="/events/edit/{{event.event_id}}" method="POST">
      <fieldset>
        <label>Date-Time (enter manually, use the picker, or populate from a unix timestamp)</label>
  <div id="event_datetime" class="input-append date">
    <input data-format="MM/dd/yyyy HH:mm:ss PP" type="text" name="event_datetime"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div>
        <label>Description</label>
        <textarea rows="10" name="event_desc">{{event.desc}}
        </textarea>
        <label>Tags (use space to separate)</label>
        <input type="text" size="10" style="width:300px" id="event_tags" name="event_tags" value="{{!','.join(event.tags)}}"/>
        <br/><button type="submit" class="btn">Submit</button>
      </fieldset>
    <script>
        $(document).ready(function() { $("#event_tags").select2({
          tags:{{![u.encode() for u in tags]}},
          tokenSeparators: [" "]});
        });
    </script>
    </form>
</div>

<script type="text/javascript">
  $(function() {
    $('#event_datetime').datetimepicker({
      language: 'en',
      pick12HourFormat: true
      });
    var picker = $('#event_datetime').data('datetimepicker');
    picker.setLocalDate(new Date({{event.timestamp}} * 1000));
  });
</script>
