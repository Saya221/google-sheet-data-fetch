require "google/apis/sheets_v4"

scopes = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY]
authorization = Google::Auth.get_application_default(scopes)

GOOGLE_SHEETS_CLIENT = Google::Apis::SheetsV4::SheetsService.new
GOOGLE_SHEETS_CLIENT.authorization = authorization
GOOGLE_SHEETS_CLIENT.key = ENV["GOOGLE_API_KEY"]
