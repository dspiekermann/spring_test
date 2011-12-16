package de.dsp.test.contact.service;

import java.util.List;

import de.dsp.test.contact.form.Contact;

public interface ContactService {
	 
    public void addContact(Contact contact);
    public List<Contact> listContact();
    public void removeContact(Integer id);

}