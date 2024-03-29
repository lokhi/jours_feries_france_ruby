require 'date'
class JoursFeriesFrance
  def self.for_year(year, include_alsace=nil)
    res = {
      'Jour de l\'an' => jourDeLAn(year).strftime('%d/%m/%Y'),
      'Fete du travail' => feteDuTravail(year).strftime('%d/%m/%Y'),
      'Victoire des allies' => victoireDesAllies(year).strftime('%d/%m/%Y'),
      'Fete Nationale' => feteNationale(year).strftime('%d/%m/%Y'),
      'Assomption' => assomption(year).strftime('%d/%m/%Y'),
      'Toussaint' => toussaint(year).strftime('%d/%m/%Y'),
      'Armistice' => armistice(year).strftime('%d/%m/%Y'),
      'Noel' => noel(year).strftime('%d/%m/%Y'),
      'Lundi de Paques' => lundiDePaques(year).strftime('%d/%m/%Y'),
      'Ascension' => ascension(year).strftime('%d/%m/%Y'),
      'Lundi de Pentecote' => lundiDePentecote(year).strftime('%d/%m/%Y')
    }

    if include_alsace
      res['Vendredi Saint'] = vendrediSaint(year).strftime('%d/%m/%Y')
      res['Saint Etienne'] = saintEtienne(year).strftime('%d/%m/%Y')
    end
    res
  end

  def self.array_for_year(year, include_alsace=nil)
    res = [
      jourDeLAn(year),
      feteDuTravail(year),
      victoireDesAllies(year),
      feteNationale(year),
      assomption(year),
      toussaint(year),
      armistice(year),
      noel(year),
      lundiDePaques(year),
      ascension(year),
      lundiDePentecote(year)
    ]

    if include_alsace
      res.push(vendrediSaint(year))
      res.push(saintEtienne(year))
    end
    res
  end

  def self.paques(year)
    a = year % 19
    b = (year / 100).floor
    c = year % 100
    d = (19 * a + b - (b / 4).floor - ((b - ((b + 8) / 25).floor + 1) / 3).floor + 15) % 30
    e = (32 + 2 * (b % 4) + 2 * (c / 4).floor - d - (c % 4)) % 7
    f = d + e - 7 * ((a + 11 * d + 22 * e) / 451).floor + 114
    month = (f / 31).floor
    day = f % 31 + 1
    Date.new(year, month, day)
  end

  def self.lundiDePaques(year)
    paques(year) + 1
  end

  def self.vendrediSaint(year)
    paques(year) - 2
  end

  def self.ascension(year)
    paques(year) + 39
  end

  def self.lundiDePentecote(year)
    paques(year) + 50
  end

  def self.jourDeLAn(year)
    Date.new(year, 1, 1)
  end

  def self.feteDuTravail(year)
    Date.new(year, 5, 1)
  end

  def self.victoireDesAllies(year)
    Date.new(year, 5, 8)
  end

  def self.feteNationale(year)
    Date.new(year, 7, 14)
  end

  def self.toussaint(year)
    Date.new(year, 11, 1)
  end

  def self.assomption(year)
    Date.new(year, 8, 15)
  end

  def self.armistice(year)
    Date.new(year, 11, 11)
  end

  def self.noel(year)
    Date.new(year, 12, 25)
  end

  def self.saintEtienne(year)
    Date.new(year, 12, 26)
  end

  def self.est_ferie(date, include_alsace = nil)
    y = date.year
    array_for_year(y, include_alsace).include?(date)
  end
end
