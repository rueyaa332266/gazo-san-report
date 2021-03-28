const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox'
    ]
  });
  const page = await browser.newPage();
  console.log("Capture base image");
  await page.goto(process.env.BaseURL);
  await page.screenshot({ path: '/report/images/base.png', fullPage: true });
  console.log("Capture compare image");
  await page.goto(process.env.CompareURL);
  await page.screenshot({ path: '/report/images/compare.png', fullPage: true });

  browser.close();
})();