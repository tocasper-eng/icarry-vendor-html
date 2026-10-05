using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace IcarryVendor.Web.Pages;

// 原型沒有首頁內容（_content.php 是 Metronic 範例儀表板），首頁直接導向商家資料管理。
public class IndexModel : PageModel
{
    public IActionResult OnGet() => RedirectToPage("/Vendor/Info");
}
