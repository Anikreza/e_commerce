<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new register.
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
            'password' => ['required','confirmed','string','min:10','regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[a-z]/',
                'regex:/[0-9]/'],
            'password_confirmation' => ['required','string','min:10','regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[a-z]/',
                'regex:/[0-9]/']
        ],
            [
                'name.required' => ':attribute can not be blank',
                'email.required' => ':attribute has to be unique',
                'password.required' => ':attribute must have at least one upper case, one lower case letter and number',
                'password_confirmation.required' => ':attribute didnt match the password',
            ]);

        $user = User::create([
            'name' => $fields['name'],
            'email' => $fields['email'],
            'password' => bcrypt($fields['password']),
            'password_confirmation' => bcrypt($fields['password_confirmation'])
        ]);

        $token = $user->createToken('myapptoken')->plainTextToken;
        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 201);
    }

    /**
     * Show the form for creating a new register.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string'
        ],
            [
                'email.required' => ':attribute can not be blank',
                'password.required' => ':attribute does not match to this email',
            ]
        );

        //  check email
        $user = User::where('email',$fields['email'])->first();

        // check password
        if(!$user || !Hash::check($fields['password'], $user->password)){
            return response([
                'message' => 'user not found'
            ],401);
        }

        $token = $user->createToken('myapptoken')->plainTextToken;
        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 201);
    }
    /**
     * Show the form for creating a new logout.
     *
     */
    public function logout(Request $request)
    {
       auth()->user()->tokens()->delete();

       return [
         'message' => 'Logged Out'
       ];
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
