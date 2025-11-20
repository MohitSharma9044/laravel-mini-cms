<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $r)
    {
        $r->validate(['email'=>'required|email','password'=>'required']);
        if (! $user = User::where('email',$r->email)->first() ) {
            return response()->json(['message'=>'Invalid credentials'], 401);
        }
        if (! Hash::check($r->password, $user->password)) {
            return response()->json(['message'=>'Invalid credentials'], 401);
        }
        $token = $user->createToken('api-token')->plainTextToken;
        return response()->json(['token'=>$token,'user'=>$user]);
    }

    public function logout(Request $r)
    {
        $r->user()->currentAccessToken()->delete();
        return response()->json(['message'=>'Logged out']);
    }

    public function me(Request $r)
    {
        return response()->json($r->user());
    }
}
