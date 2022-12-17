@extends('admin.layouts.app')

@section('title')
    {{ __('Country') }}
@endsection

@section('breadcrumbs')
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('backend/plugins/bootstrap-switch/css/bootstrap4/bootstrap-switch.css') }}">
@endsection


@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Country List') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.location.create') }}" class="btn bg-primary">
                                    <i class="fas fa-plus mr-1"></i> &nbsp;
                                    {{ __('Create Country') }}
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-bordered">
                            <thead>
                                <th>#</th>
                                <th>Name</th>


                                <th>Status</th>

                                <th class="text-center">Action</th>
                            </thead>
                            <tbody>
                                @foreach ($locations as $location)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $location->location }}</td>
                                        <td>
                                            <input type="checkbox" data-on-color="success" data-off-color="danger"
                                                data-handle-width="auto" name="status" data-id={{ $location->id }}
                                                @if ($location->status) checked @endif>
                                        </td>
                                        <td class="d-flex justify-centent-between">
                                            <div class="mx-auto">

                                                <a class="btn btn-info"
                                                    href="{{ route('admin.location.edit', ['location' => $location->id]) }}"><i
                                                        class="fa fa-edit"></i></a>
                                            </div>
                                            <div class="mx-auto">

                                                <form
                                                    action="{{ route('admin.location.destroy', ['location' => $location->id]) }}"
                                                    method="post">
                                                    @method('DELETE')
                                                    @csrf

                                                    <button type="submit" class="btn btn-danger"><i
                                                            class="fa fa-trash"></i></button>

                                                </form>
                                            </div>

                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>


                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('backend/plugins/bootstrap-switch/js/bootstrap-switch.js') }}"></script>
    <script>
        $("[name='status']").bootstrapSwitch();
        $('input[name="status"]').on('switchChange.bootstrapSwitch', function(event, state) {

            console.log(state);
            let id = event.target.getAttribute('data-id');
            console.log(id);

            $.ajax({

                type: 'POST',

                url: "{{ route('admin.location.statusChange') }}",

                data: {
                    status: state,
                    id: id,

                },

                success: function(data) {
                    console.log(data);
                    if (data == "success") {
                        toastr.success('Status Change Successfully');
                    }

                }

            });


        });
    </script>
@endsection
