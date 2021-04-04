@if($districts)
<option selected disabled> Select District </option>
    @foreach ($districts as $district)
        <option value="{{ $district->id }}" @if($district->id == $district_id) selected @endif>{{ ucfirst($district->name)}}</option>
    @endforeach
@endif

