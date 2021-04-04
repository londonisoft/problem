@if($thanas)
<option selected disabled> Select Thana </option>
    @foreach ($thanas as $thana)
        <option value="{{ $thana->id }}" @if($thana->id == $thana_id) selected @endif>{{ ucfirst($thana->name)}}</option>
    @endforeach
@endif