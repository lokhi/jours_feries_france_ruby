class JoursFeriesFrance

	def self.for_year(year, include_alsace=nil)
      res = {
          "Jour de l'an" => self.jourDeLAn(year).strftime("%d/%m/%Y"),
          "Fete du travail" => self.feteDuTravail(year).strftime("%d/%m/%Y"),
          "Victoire des allies" => self.victoireDesAllies(year).strftime("%d/%m/%Y"),
          "Fete Nationale" => self.feteNationale(year).strftime("%d/%m/%Y"),
          "Assomption" => self.assomption(year).strftime("%d/%m/%Y"),
          "Toussaint" => self.toussaint(year).strftime("%d/%m/%Y"),
          "Armistice" => self.armistice(year).strftime("%d/%m/%Y"),
          "Noel" => self.noel(year).strftime("%d/%m/%Y"),
          "Lundi de Paques" => self.lundiDePaques(year).strftime("%d/%m/%Y"),
          "Ascension" => self.ascension(year).strftime("%d/%m/%Y"),
          "Lundi de Pentecote" => self.lundiDePentecote(year).strftime("%d/%m/%Y")
      }

    if include_alsace
      res["Vendredi Saint"] = self.vendrediSaint(year).strftime("%d/%m/%Y")
      res["Saint Etienne"] = self.saintEtienne(year).strftime("%d/%m/%Y")
    end
    res
	end

  def self.array_for_year(year, include_alsace=nil)
    res = [
    self.jourDeLAn(year),
    self.feteDuTravail(year),
    self.victoireDesAllies(year),
    self.feteNationale(year),
    self.assomption(year),
    self.toussaint(year),
    self.armistice(year),
    self.noel(year),
    self.lundiDePaques(year),
    self.ascension(year),
    self.lundiDePentecote(year)
    ]

    if include_alsace
      res.push(self.vendrediSaint(year))
      res.push(self.saintEtienne(year))
    end
    res
  end



	def self.paques(year)
		a = year % 19
		b = (year / 100).floor
		c = year % 100
		d = (19 * a + b - (b / 4).floor - (((b - ((b + 8) / 25).floor + 1) / 3).floor) + 15) % 30
		e = (32 + 2 * (b % 4) + 2 * ((c / 4).floor) - d - (c % 4)) % 7
		f = d + e - 7 * (((a + 11 * d + 22 * e) / 451).floor) + 114
		month = (f / 31).floor
		day = f % 31 + 1
	    Date.new(year,month,day)
	end

	def  self.lundiDePaques(year)
		return self.paques(year) + 1
	end

	def  self.vendrediSaint(year)
        return self.paques(year) - 2
	end

	def  self.ascension(year)
		return self.paques(year) + 39
	end

	def self.lundiDePentecote(year)
		return self.paques(year) + 50
	end

	def self.jourDeLAn(year)
		Date.new(year,1,1)
	end


  def self.feteDuTravail(year)
    Date.new(year,5,1)
  end


  def self.victoireDesAllies(year)
    Date.new(year,5,8)
  end


  def self.feteNationale(year)
    Date.new(year,7,14)
  end


  def self.toussaint(year)
    Date.new(year,11,1)
  end


  def self.assomption(year)
    Date.new(year,8,15)
  end


  def self.armistice(year)
    Date.new(year,11,11)
  end


  def self.noel(year)
    Date.new(year,12,25)
  end


  def self.saintEtienne(year)
    Date.new(year,12,26)
  end

  def self.est_ferie(date)
    y = date.year
    array_for_year(y).include?(date)
  end

end
