package de.dsp.test.contact.dao;

import java.util.List;

import de.dsp.test.contact.form.Contact;

public interface ContactDAO {
	 
    public void addContact(Contact contact);
    public List<Contact> listContact();
    public void removeContact(Integer id);

}