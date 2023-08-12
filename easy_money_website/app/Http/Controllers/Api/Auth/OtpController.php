<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Twilio\Exceptions\ConfigurationException;
use Twilio\Exceptions\TwilioException;
use Twilio\Rest\Client;
use Illuminate\Http\Request;

class OtpController extends Controller
{
    /**
     * @throws TwilioException
     * @throws ConfigurationException
     */
    public function send(Request $request): JsonResponse
    {
        $request->validate([
            'phone_number' => 'required',
            'otp_code' => 'required',
        ]);
        // Your Account SID and Auth Token from twilio.com/console
        $account_sid = 'AC039bf4530bf5c6b7271f87cbf7d18b23';
        $auth_token = '2b8c56ae0773cfdb2c2304827fcd40fd';
        // In production, these should be environment variables. E.g.:
        // $auth_token = $_ENV["TWILIO_AUTH_TOKEN"]

        // A Twilio number you own with SMS capabilities
        $twilio_number = "+16627950039";

        $client = new Client($account_sid, $auth_token);
        $client->messages->create(
        // Where to send a text message (your cell phone?)
            $request->phone_number,
            array(
                'from' => $twilio_number,
                'body' => 'Your verification code is '.$request->otp_code
            )
        );

        return response()->json();
    }
}
