# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')  { "spec" }
  watch('config.ru')  { "spec" }
  watch(%r{^apps/.+\.rb$}) { "spec" }
  watch(%r{^models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb"}
  watch('spec/factories.rb') { "spec" }
  watch(%r{^views/(.+)/(.+)\.erb$}) { |m| "spec/apps/#{m[1]}_spec.rb" }
end
