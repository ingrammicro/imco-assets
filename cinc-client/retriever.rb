#!/usr/bin/env ruby
version='17.10.0'
build='1'
default_archs = %w(arm64 amd64)
{
  'el/7' => ['el/7', 'cinc-<version>-<build>.el7.<arch>.rpm', %w(aarch64 x86_64)],
  'el/8' => ['el/8', 'cinc-<version>-<build>.el8.<arch>.rpm', %w(aarch64 x86_64)],
  'debian/9' => ['debian/9', 'cinc_<version>-<build>_<arch>.deb', %w(amd64)],
  'debian/10' => ['debian/10', 'cinc_<version>-<build>_<arch>.deb'],
  'debian/11' => ['debian/11', 'cinc_<version>-<build>_<arch>.deb'],
  'windows/2016' => ['windows/2016', 'cinc-<version>-<build>-<arch>.msi', %w(x64)],
  'windows/2019' => ['windows/2019', 'cinc-<version>-<build>-<arch>.msi', %w(x64)],
  'windows/2022' => ['windows/2022', 'cinc-<version>-<build>-<arch>.msi', %w(x64)],
  'ubuntu/18.04' => ['ubuntu/18.04', 'cinc_<version>-<build>_<arch>.deb'],
  'ubuntu/22.04' => ['ubuntu/22.04', 'cinc_<version>-<build>_<arch>.deb'],
  'ubuntu/20.04' => ['ubuntu/20.04', 'cinc_<version>-<build>_<arch>.deb'],
}.each do |dir, (path, file_format, archs)|
  dir = "#{%x(pwd).chomp}/#{dir}"
  archs ||= default_archs
  archs.each do |arch|
    file = file_format.gsub('<version>', version).gsub('<build>', build).gsub('<arch>', arch.to_s)
    puts "echo '#{dir} -> #{arch}' && mkdir -p #{dir} && curl 'http://downloads.cinc.sh/files/stable/cinc/17.10.0/#{path}/#{file}' >'#{dir}/#{file}' && echo && echo"
  end
end
