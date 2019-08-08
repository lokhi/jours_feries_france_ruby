# Jours Fériés France
This library computes bank holidays dates for France, for a given year.

## Installation
```
gem install jours-feries-france
```

## Usage
```ruby
require 'Jours_ferie_france'

puts JoursFeriesFrance.est_ferie(Date.new(2019,01,01))
#return true
puts JoursFeriesFrance.est_ferie(Date.new(2019,03,31))
#return false

```


## Notice
This software is available under the MIT license and was inspired / copied from
https://github.com/AntoineAugusti/jours-feries-france
