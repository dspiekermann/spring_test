package de.dsp.test.persistence.dao;

import java.util.List;

import de.dsp.test.persistence.model.Kunden;

public interface KundenDAO {

	public void addKunde(Kunden kunde);
	public void updateKunde(Kunden kunde);
	public List<Kunden> listKunde();
	public void deleteKunde(int id);
	public Kunden getKunde(int id);
	
}