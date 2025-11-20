<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('Passw@rd123'),
            'role' => 'admin', // if you have a role column
        ]);

        // Optional: generate 10 fake users
        User::factory(10)->create();
    }
}
