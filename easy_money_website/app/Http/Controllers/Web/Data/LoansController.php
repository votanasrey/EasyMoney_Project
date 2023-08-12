<?php

namespace App\Http\Controllers\Web\Data;

use App\Http\Controllers\Controller;
use App\Models\Loan;
use App\Models\LoanRequest;
use Illuminate\Http\Request;

class LoansController extends Controller
{
    public function index() {
        $loanRequests = LoanRequest::query()
            ->with(['user'])
            ->orderBy('created_at', "desc")
            ->paginate(15);

        return view('loans')->with(['loanRequests' => $loanRequests]);
    }

    public function update(Request $request, LoanRequest $loanRequest) {
        $request->validate([
            'status' => 'required'
        ]);

        $loanRequest->status = $request->get('status');
        $loanRequest->save();

        return redirect('loans');
    }
}
