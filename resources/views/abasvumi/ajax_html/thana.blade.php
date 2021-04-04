@if($thanas)
<option selected disabled> Select Thana </option>
    @foreach ($thanas as $thana)
        <option value="{{ $thana->id }}"  >{{ ucfirst($thana->name)}}</option>
    @endforeach
@endif