<div>
    <section class="section contact">
        <div class="container">
            <div class="contact-form mt-4">
                <div class="contact-form__left">
                    <h2 class="contact-form__title text--heading-2">{{ __('contact_info') }}</h2>

                    <ul class="contact__details">
                        <li class="contact__details-item">
                            <span class="icon">
                                <x-svg.phone-icon />
                            </span>
                            <p class="text--body-3">{{ $cms->contact_number }}</p>
                        </li>
                        <li class="contact__details-item">
                            <span class="icon">
                                <x-svg.envelope-icon />
                            </span>

                            <p class="text--body-3 text-lowercase">
                                {{ $cms->contact_email }}
                            </p>
                        </li>
                        <li class="contact__details-item">
                            <span class="icon">
                                <x-svg.address-icon />
                            </span>

                            <p class="text--body-3">
                                {{ $cms->contact_address }}
                            </p>
                        </li>
                    </ul>
                </div>

                <div class="contact-form__right">
                    @if ($success)
                      <div class="alert alert-success" role="alert">
                        {{ $success }}
                      </div>
                    @endif
                    <h2 class="contact-form__title text--heading-2">{{ __('send_message') }}</h2>

                    <form wire:submit.prevent="submitContact" method="Post">
                        @csrf
                        <div class="input-field__group">
                            <div class="input-field">
                                <input type="text" name="name" wire:model.defer="name" class="form-control @error('name') is-invalid @enderror"  placeholder="{{ __('full_name') }}"/>
                                @error('name')
                                    <p class="text-danger text-sm"> {{ $message }} </p>
                                @enderror
                            </div>
                            <div class="input-field">
                                <input type="email" name="email" wire:model.defer="email" class="form-control @error('email') is-invalid @enderror"  placeholder="{{ __('email_address') }}"  />
                                @error('email')
                                    <p class="text-danger text-sm"> {{ $message }} </p>
                                @enderror
                            </div>
                        </div>
                        <div class="input-field">
                            <input type="text" name="subject" wire:model.defer="subject" class="form-control @error('subject') is-invalid @enderror" placeholder="{{ __('subjects') }}"  />
                                @error('subject')
                                    <p class="text-danger text-sm"> {{ $message }} </p>
                                @enderror
                        </div>
                        <div class="input-field--textarea">
                            <textarea placeholder="{{ __('message') }}" name="message" wire:model.defer="message" class="form-control @error('message') is-invalid @enderror" style="resize: none"></textarea>
                            @error('message')
                                <p class="text-danger text-sm"> {{ $message }} </p>
                            @enderror
                        </div>

                        <button class="btn" type="submit">{{ __('send_message') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
