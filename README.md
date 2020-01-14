# SAJ Collector

[![Build Status](https://travis-ci.org/jwillemsen/saj_collector.png)](https://travis-ci.org/jwillemsen/saj_collector)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fdb313b9a4b24614867b91e45a5505f9)](https://www.codacy.com/app/jwillemsen/saj_collector?utm_source=github.com&utm_medium=referral&utm_content=jwillemsen/saj_collector&utm_campaign=badger)
[![Gem Version](https://badge.fury.io/rb/saj_collector.svg)](http://badge.fury.io/rb/saj_collector)

Pull stats from SAJ Solar Inverter and push them to PVOutput. This
ruby gem is based on https://github.com/johnf/jfy_collector

## Installation

First install [ruby](https://www.ruby-lang.org) on your system through your favorite package manager. On Windows download and install ruby from [Rubyinstaller](http://www.rubyinstaller.org).

Install it by running the following command from a linux shell or windows command prompt

    gem install saj_collector

## Usage

Create a config file for PVOutput in ```saj_collector.yaml```.
This should contain the IP address of your SAJ Solar Invertor (```saj```), your
PVOutput system id (```system_id```) and PVOutput API key (```api_key```). These PVOutput
system id and API key can be found on your
[PVOutput account page](https://pvoutput.org/account.jsp).

``` yaml
:saj: a.b.c.d
:system_id: 123456
:api_key: fb6a2e3
:day_trend_multiplication_factor: 100
```

Run the SAJ Collector in a screen or via init of some sort

    saj_collector

This will run the current power generation frm the SAJ Collector and push the
data once to PVOutput. You can add
``saj_collector`` to your crontab or a custom script to let it automatically push with
a certain frequency.

The SAJ Output Collector will retrieve the generation of each day of the current month and
push the data once to PVOutput.
Run the SAJ Output Collector in a screen or via init of some sort

    saj_output_collector

You can add ``saj_output_collector`` to your crontab or a custom script to let it automatically push with
a certain frequency.

Some SAJ Solar Inverters provide the generation of each day with a granularity of 0.1kWh and some with
a granularity of 0.01kWh. In case of the last you have to change the ```day_trend_multiplication_factor```
within your ```saj_collector.yaml``` to 10.

At the moment you add any of these to your crontab you have to make sure
that the ``saj_collector.yaml`` file can be found. For example when you put the ``saj_collector.yaml`` file
in /usr/local/bin (and also the gem) and want to run it each 5 minutes between 6AM and 10PM you should
add to your crontab

    */5 6-21 * * * cd /usr/local/bin && ruby /usr/local/bin/saj_collector

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number
in `lib/saj_collector/version.rb`, and then run `bundle exec rake release`, which
will create a git tag for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwillemsen/saj_collector.
This project is intended to be a safe, welcoming space for
collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms
of the [MIT License](http://opensource.org/licenses/MIT).

