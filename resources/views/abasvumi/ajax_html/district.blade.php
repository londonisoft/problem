@if($districts)
<option selected disabled> Select District </option>
    @foreach ($districts as $district)
        <option value="{{ $district->id }}">{{ ucfirst($district->name)}}</option>
    @endforeach
@endif

