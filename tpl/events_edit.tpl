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
		<input data-format="MM/dd/yyyy HH:mm:ss PP" type="text" name="event_datetime" id="event_datetime"></input>
		<input type="hidden" size="10" maxlength="10" id="event_timestamp" name="event_timestamp" placeholder="unix timestamp"/>
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
    var picker = new Pikaday({
        field: $('#event_datetime')[0],
        showTime: true,
        format: "YYYY-MM-DD hh:mm A Z",
        onSelect: function() {
            $('#event_timestamp').val(this.getMoment().unix());
        }
    });
    picker.setMoment(moment.unix({{event.timestamp}}));
  });
</script>
