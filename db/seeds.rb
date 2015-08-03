Format.create([{ name: 'maildir' }, { name: 'sdbox' }])
Domain.create([{ name: 'example', description: 'Just an example' }])
User.new({ email: 'postmaster@example.com', password: 'a1b2c3d4', password_confirmation: 'a1b2c3d4'}).save
