@extends('admin.layouts.app')

@section('title')
    {{ __('Sms Package') }}
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
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Slider List') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.sms.package.create') }}" class="btn bg-primary">
                                    <i class="fas fa-plus mr-1"></i> &nbsp;
                                    {{ __('Create Package') }}
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-bordered">
                            <thead>
                                <th>#</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Amount of Sms</th>
                                <th>Status</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @foreach ($smsPackages as $smsPackage)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $smsPackage->name }}</td>
                                        <td>{{ $smsPackage->price }}</td>
                                        <td>{{ $smsPackage->amount_of_sms }}</td>
                                        <td>
                                            <input type="checkbox" data-on-color="success" data-off-color="danger"
                                                data-handle-width="auto" name="status" data-id={{ $smsPackage->id }}
                                                @if ($smsPackage->status) checked @endif>
                                        </td>
                                        <td class="d-flex justify-content-center">
                                            <a href="{{ route('admin.sms.package.edit', ['package' => $smsPackage->id]) }}"
                                                class="btn btn-info mx-1"><i class="fas fa-edit"></i></a>

                                            <form
                                                action="{{ route('admin.sms.package.destroy', ['package' => $smsPackage->id]) }}"
                                                method="post">
                                                @method('DELETE')
                                                @csrf
                                                <button type="submit" class="btn btn-danger mx-1"><i
                                                        class="fas fa-trash"></i></button>
                                            </form>

                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>

                        </table>
                        <div class="d-flex justify-content-center">
                            {{ $smsPackages->links() }}
                        </div>
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

                url: "{{ route('admin.sms.statusChange') }}",

                data: {
                    status: state,
                    id: id,

                },

                success: function(data) {

                    if (data == "success") {
                        toastr.success('Status Change Successfully');
                    }

                }

            });


        });
    </script>
@endsection
