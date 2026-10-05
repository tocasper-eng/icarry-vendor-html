# iCarry Vendor 商家管理後台（UI 原型）

iCarry 商家後台的 UI 原型，從 Bitbucket `icarryfolks/icarry-vendor-html`（PHP include 版）改寫成 **ASP.NET Core 10 Razor Pages**。

目前只有畫面，沒有資料庫和商業邏輯，表單與按鈕不會真的送出資料。

## 頁面

| 網址 | 頁面 | 原型檔案 |
|---|---|---|
| `/` | 導向 `/Vendor/Info` | `index.php` |
| `/Vendor/Info` | 商家資料管理 | `pages/vendor-info.php` |
| `/Vendor/Accounts` | 商家帳號管理 | `pages/vendor-account-list.php` |
| `/Products` | 商品管理列表 | `pages/product-list.php` |
| `/Products/Edit` | 商品編輯／新增 | `pages/product-edit.php` |
| `/SignIn` | 登入 | `sign-in.php` |

原型裡切換頁面要手動改 `layout/_default.php` 的註解；改寫後用網址切換，側邊選單會標示目前所在頁面。

## 結構

```
src/IcarryVendor.Web/
  Pages/
    Shared/_Layout.cshtml    ← index.php + layout/_default.php
    Shared/_Header.cshtml    ← layout/partials/_header.php
    Shared/_Sidebar.cshtml   ← layout/partials/_sidebar.php
    Shared/_Footer.cshtml    ← layout/partials/_footer.php
    Vendor/  Products/       ← pages/*.php
    SignIn.cshtml            ← sign-in.php（不套用版面）
  wwwroot/assets/            ← 版型靜態資源（不進版控，見下方）
tools/copy-legacy-assets.ps1
```

各頁面專用的 JS 放在該頁的 `@section Scripts`，在共用的 plugin bundle 之後載入。

## 靜態資源（Metronic 版型）

`wwwroot/assets/` 是 Keenthemes 的 **Metronic** 商用版型，授權不允許公開散布，所以沒有放進這個 repo。第一次執行前，請從舊版原型複製：

```powershell
# 預設來源是上一層目錄（舊版 icarry-vendor-html 的 clone）
./tools/copy-legacy-assets.ps1
# 或指定舊版原型的位置
./tools/copy-legacy-assets.ps1 -LegacyRoot C:\path\to\icarry-vendor-html
```

## 執行

需要 .NET 10 SDK。

```powershell
dotnet run --project src/IcarryVendor.Web --launch-profile http
```

開啟 http://localhost:5177 。

## 和原型的差異

- 首頁原本是 Metronic 範例儀表板（`_content.php`，內容是英文 demo），沒有搬過來，改成導向商家資料管理。
- 商家資料管理頁原本有一段 Metronic 範例的 Dropzone 程式，要掛的元素不存在，而且會上傳到 keenthemes.com 的測試網址，已移除。
- 行內 `url(assets/...)` 等相對路徑改成 `/assets/...`，避免在子路徑底下找不到檔案。
- 「組合商品」選單和「查看商店」連結在原型裡沒有對應頁面，暫時指向 `#`。
