# frozen_string_literal: true

task :export_yaml do
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["import_csv:buttons"].invoke
  Rake::Task["import_csv:answers"].invoke
  Rake::Task["import_csv:faqs"].invoke
  Api::V1::ExportFaqsService.new.perform
end
