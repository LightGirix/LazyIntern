import os
from dotenv import load_dotenv
import asyncio
from playwright.async_api import async_playwright, Playwright, BrowserContext


# Load variables from .env
load_dotenv() # Default to .env, if you use .env.{any}, change to load_dotenv('env.{any}')
STUDENT_ID = os.getenv("STUDENT_ID")
PASSWORD = os.getenv("PASSWORD")


async def run(playwright: Playwright):
    chromium = playwright.chromium # or "firefox" or "webkit".
    browser = await chromium.launch(headless=False)

    context = await browser.new_context(
        user_agent="LazyInternProject/0.1 (by 6733110721 Discord: lightgirix)"
    )

    # Ignore this error, Pylance just sucks here.
    page = await context.new_page() # type: ignore

    # Go to CEDT Intern Website, not logged in
    await page.goto("https://cedtintern.cp.eng.chula.ac.th/")
    await page.get_by_role("button", name="เข้าสู่ระบบด้วยบัญชี myCourseVille").click()

    # Arrive at myCourseVille
    await page.wait_for_load_state("networkidle")
    await page.locator("a[href='https://www.mycourseville.com/api/chulalogin']").click()

    await page.locator("div input[type='username']").type(STUDENT_ID) # type: ignore
    await page.locator("div input[type='password']").type(PASSWORD) # type: ignore
    await page.locator("div button[type='submit']").click()

    await page.wait_for_load_state("networkidle")

    await page.locator("a[href='/companies']").click()

    await page.wait_for_load_state("networkidle")

    companies = page.locator("div[class='flex flex-col w-full h-fit bg-white px-6 pb-6 mt-[-1px] rounded-b-md gap-2']")

    companies_texts = await companies.all_inner_texts()
    for text in companies_texts:
        print(text)

    await browser.close()

async def main():
    async with async_playwright() as playwright:
        await run(playwright)
asyncio.run(main())