%w{
gcc
git
}.each do |pkg|
  package pkg do
    action :install
  end
end

#gcc-c++
