# # encoding: utf-8

# Inspec test for recipe sample1::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html
unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe command('java -version') do
  its(:stderr) do
    should match(/java version "[._\d]*"/)
  end

  its(:stderr) do
    should match(/Java\(TM\) SE Runtime Environment/)
  end

  its(:stderr) do
    should match(/Java HotSpot\(TM\) \d+-Bit Server VM/)
  end
end

describe package('nginx') do
  it { should be_installed }
  its('version') { should eq '1.10.2-1.el7.ngx' }
end

describe file '/etc/nginx/nginx.conf' do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_mode 0644 }
  its('content')  { should match 'worker_connections  1024;'  }
  its('content')  { should match 'keepalive_timeout  65;'  }
end
