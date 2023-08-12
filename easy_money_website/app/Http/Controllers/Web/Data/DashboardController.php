<?php

namespace App\Http\Controllers\Web\Data;

use App\Http\Controllers\Controller;
use App\Models\LoanRequest;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class DashboardController extends Controller
{
    public function index()
    {
        $totalUsers = $this->countTotalData(new User());
        $newUsers = $this->countNewData(new User());
        $activeUsers = $totalUsers * 0.8;
        $totalLoanRequests = $this->countTotalData(new LoanRequest());
        $newLoanRequests = $this->countNewData(new LoanRequest());
        $totalProductPosts = $this->countTotalData(new Product());
        $newProductPosts = $this->countNewData(new Product());
        $productSold = Product::query()->where('is_sold', '=', true)->count();

        $totalUsersPercentage = $this->growthPercentageCalculator($this->countTotalDataLastMonth(new User()), $totalUsers);

        $listCard = [
            ['icon' => 'users', 'color' => 'primary', 'title' => 'Total Users', 'data' => $totalUsers, 'percentage' => $totalUsersPercentage],
            ['icon' => 'user-plus', 'color' => 'success', 'title' => 'New Registers', 'data' => $newUsers, 'percentage' => 2.30,],
            ['icon' => 'user-check', 'color' => 'primary', 'title' => 'Active Users', 'data' => $activeUsers, 'percentage' => 2.30,],
            ['icon' => 'dollar-sign', 'color' => 'success', 'title' => 'Total Loan Request', 'data' => $totalLoanRequests, 'percentage' => 0,],
            ['icon' => 'dollar-sign', 'color' => 'success', 'title' => 'New Loan Request', 'data' => $newLoanRequests, 'percentage' => -5,],
            ['icon' => 'shopping-bag', 'color' => 'primary', 'title' => 'Total Product Posts', 'data' => $totalProductPosts, 'percentage' => 2.30,],
            ['icon' => 'shopping-bag', 'color' => 'success', 'title' => 'New Product Posts', 'data' => $newProductPosts, 'percentage' => 2.30,],
            ['icon' => 'shopping-cart', 'color' => 'primary', 'title' => 'Product Sold', 'data' => $productSold, 'percentage' => 2.30,],
        ];

        return view('index')->with(['listCard' => $listCard]);
    }

    private function countTotalData(Model $model): int
    {
        return $model->newQuery()->count();
    }

    private function countNewData(Model $model): int
    {
        $lastWeekDate = Carbon::now();
        $lastWeekDate->day = $lastWeekDate->day - 7;
        return $model
            ->newQuery()
            ->whereDate('created_at', '>=', $lastWeekDate)
            ->count();
    }

    private function countTotalDataLastMonth(Model $model): int
    {
        $lastMonthDate = Carbon::now();
        $lastMonthDate->month--;
        return $model->newQuery()
            ->whereDate('created_at', '<=', $lastMonthDate)
            ->count();
    }

    private function countNewDataLastMonth(Model $model): int
    {
        $statDate = Carbon::now();
        $statDate->month--;
        $statDate->day = $statDate->day - 7;

        $endDate = $statDate;
        $endDate->month--;

        return $model->newQuery()
            ->whereBetween('created_at', [$statDate, $endDate])
            ->count();
    }

    private function growthPercentageCalculator(int $oldValue, int $newValue)
    {
        $data = $newValue - $oldValue;
        if ($oldValue == 0) {
            return $data * 100;
        }
        return ($data / $oldValue) * 100;
    }
}
