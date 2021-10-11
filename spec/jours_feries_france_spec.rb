require 'spec_helper'

describe JoursFeriesFrance do
  describe '#jourDeLAn' do
    it 'return the first day of the year' do
      expect(JoursFeriesFrance.jourDeLAn(2021)).to eq(Date.new(2021, 1, 1))
    end
  end

  describe '#feteDuTravail' do
    it 'return the 1 May ' do
      expect(JoursFeriesFrance.feteDuTravail(2021)).to eq(Date.new(2021, 5, 1))
    end
  end

  describe '#victoireDesAllies' do
    it 'return the 8 May ' do
      expect(JoursFeriesFrance.victoireDesAllies(2021)).to eq(Date.new(2021, 5, 8))
    end
  end

  describe '#feteNationale' do
    it 'return the 14 July ' do
      expect(JoursFeriesFrance.feteNationale(2021)).to eq(Date.new(2021, 7, 14))
    end
  end

  describe '#assomption' do
    it 'return the 15 August ' do
      expect(JoursFeriesFrance.assomption(2021)).to eq(Date.new(2021, 8, 15))
    end
  end

  describe '#toussaint' do
    it 'return the 1 November ' do
      expect(JoursFeriesFrance.toussaint(2021)).to eq(Date.new(2021, 11, 1))
    end
  end

  describe '#armistice' do
    it 'return the 11 November ' do
      expect(JoursFeriesFrance.armistice(2021)).to eq(Date.new(2021, 11, 11))
    end
  end

  describe '#noel' do
    it 'return the 25 December ' do
      expect(JoursFeriesFrance.noel(2021)).to eq(Date.new(2021, 12, 25))
    end
  end

  describe '#lundiDePaques' do
    it 'return the easter Monday ' do
      expect(JoursFeriesFrance.lundiDePaques(2022)).to eq(Date.new(2022, 4, 18))
      expect(JoursFeriesFrance.lundiDePaques(2021)).to eq(Date.new(2021, 4, 5))
      expect(JoursFeriesFrance.lundiDePaques(2020)).to eq(Date.new(2020, 4, 13))
    end
  end

  describe '#ascension' do
    it 'return the ascension day ' do
      expect(JoursFeriesFrance.ascension(2022)).to eq(Date.new(2022, 5, 26))
      expect(JoursFeriesFrance.ascension(2021)).to eq(Date.new(2021, 5, 13))
      expect(JoursFeriesFrance.ascension(2020)).to eq(Date.new(2020, 5, 21))
    end
  end

  describe '#lundiDePentecote' do
    it 'return the monday of "Pentecote"' do
      expect(JoursFeriesFrance.lundiDePentecote(2022)).to eq(Date.new(2022, 6, 6))
      expect(JoursFeriesFrance.lundiDePentecote(2021)).to eq(Date.new(2021, 5, 24))
      expect(JoursFeriesFrance.lundiDePentecote(2020)).to eq(Date.new(2020, 6, 1))
    end
  end

  describe '#vendrediSaint' do
    it 'return the Date of "Vendredi Saint"' do
      expect(JoursFeriesFrance.vendrediSaint(2022)).to eq(Date.new(2022, 4, 15))
      expect(JoursFeriesFrance.vendrediSaint(2021)).to eq(Date.new(2021, 4, 2))
      expect(JoursFeriesFrance.vendrediSaint(2020)).to eq(Date.new(2020, 4, 10))
    end
  end

  describe '#saintEtienne' do
    it 'return the Date of the saint Etienne 26 of december' do
      expect(JoursFeriesFrance.saintEtienne(2022)).to eq(Date.new(2022, 12, 26))
      expect(JoursFeriesFrance.saintEtienne(2021)).to eq(Date.new(2021, 12, 26))
      expect(JoursFeriesFrance.saintEtienne(2020)).to eq(Date.new(2020, 12, 26))
    end
  end

  describe '#est_ferie' do
    it 'return true if the day is a bank haliday' do
      expect(JoursFeriesFrance.est_ferie(Date.new(2022, 12, 25))).to be(true)
    end

    it 'return false if the day is not a bank haliday' do
      expect(JoursFeriesFrance.est_ferie(Date.new(2022, 12, 26))).to be(false)
    end

    it 'return false if the day is alsace bank haliday' do
      expect(JoursFeriesFrance.est_ferie(Date.new(2022, 12, 26), true)).to be(true)
    end
  end
end
