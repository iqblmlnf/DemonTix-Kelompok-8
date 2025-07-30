<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|string|unique:users,username',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
        ]);

        User::create([
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['message' => 'User registered successfully']);
    }
    public function login(Request $request)
    {
        // Hardcoded admin login
        if (
            $request->username === 'admin' &&
            $request->password === 'password'
        ) {
            return response()->json([
                'message' => 'Login berhasil',
                'role' => 'admin',
            ]);
        }

        // Cek user dari database
        $user = User::where('username', $request->username)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Login gagal',
            ], 401);
        }

        return response()->json([
            'message' => 'Login berhasil',
            'role' => 'user',
        ]);
    }
}
