package de.dsp.test.controller.kunden;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.dsp.test.persistence.model.Kunden;
import de.dsp.test.persistence.service.KundenService;

@Controller
public class KundenController {

	@Autowired
	private KundenService kundenService;
	
	/**
	 * Zeige das Kunden Grundgerüst an.
	 * In der jsp Datei werden dann per JQuery die 
	 * einzelnen parts per Ajax geladen.
	 * @return
	 */
	
	@RequestMapping("/office/kunden") 
    public ModelAndView showKunden(){
		String pageh1title = "Spring3 Advanced Example - Kunden";
		return new ModelAndView("/office/kunden", "pageh1title", pageh1title); 
	}
	
	/**
	 * Methode zum hinzufügen eines neuen Kunden per POST
	 * Die Tabelle wird danach per JQuery automatisch aktualisiert
	 * Man könnte auch z.B. einen String zurückgeben und diesen in ein
	 * status_div laden. (Der Kunde mit der Id wurde gespeichert)
	 * @param kunde
	 * @param result
	 */
	
	@RequestMapping(value = "/office/kundenadd", method = RequestMethod.POST)
    public String addKunde(@ModelAttribute("kundenobj") Kunden kunde, 
    		BindingResult result) {
		if(kunde == null)
			return null;
		
		// Das Kunden POJO sollte vorher überprüft werden..		
		if(kunde.getId() == -1) {
			kundenService.addKunde(kunde);
		} else {
			kundenService.updateKunde(kunde);
		}
		
		return "redirect:/office/kunden";
    }
	
	/**
	 * Löschmethode, nach dem Aufruf wird die Tabelle mittels JQuery
	 * automatisch aktualisiert
	 * @param Id
	 * @return
	 */
	
 
    @RequestMapping(value="/office/kundendelete", method=RequestMethod.GET)
    public String deleteContact(@RequestParam("id") int Id) {
    	kundenService.deleteKunde(Id); // Sollte vorher überprüft werden    
    	return "redirect:/office/kunden";
    }
    
    /**
     * Um die Tabelle ohne die Seite neu zu laden zu aktualisieren
     * muss diese in einem seperaten View sein.
     * @return ModelAndView
     */
    
    @RequestMapping("/office/kundentable") 
    public ModelAndView showKundenTable() { 
		ModelMap mM = new ModelMap();
		
		mM.addAttribute("kunden", kundenService.listKunde());
		mM.addAttribute("kundenObj", new Kunden());
		
		return new ModelAndView("/office/kundentable", mM); 
	}
    
    /**
     * Unser Dialog für neue Kunden
     * Wenn die Id nicht -1 ist wird der Kunde geladen
     * HttpServletRequest benötigen wir für die Lokalisierung
     * @param kid
     * @param request
     * @return ModelAndView
     */
    
    @RequestMapping(value="/office/kundenneu", method=RequestMethod.GET) 
    public ModelAndView showKundenNeu(@RequestParam("kid") int kid, HttpServletRequest request) {
    	Kunden kunde = null;
    	
    	if(kid == -1) {
    		kunde = new Kunden();
    		kunde.setId(-1); // Wäre sonst null (0)
    	} else {
    		kunde = kundenService.getKunde(kid); // die id sollte vorher überprüft werden!
    	}
    	
    	String dialogtitle = "Neuer Kunde";
    	
    	// Quick solution..
    	
    	if(kid == -1 && request.getLocale().getLanguage().equals("en"))
    		dialogtitle = "New Customer";
    	else if (kid != -1 && request.getLocale().getLanguage().equals("en"))
    		dialogtitle = "Edit Customer " + kunde.getVorname() + " " + kunde.getNachname();
    	else if (kid != -1 && request.getLocale().getLanguage().equals("de"))
    		dialogtitle = "Kunden bearbeiten " + kunde.getVorname() + " " + kunde.getNachname();
 
    	
		ModelMap mM = new ModelMap();
		
		mM.addAttribute("kunde", kunde);
		mM.addAttribute("dialogtitle", dialogtitle);
		
		return new ModelAndView("/office/kundenneu", mM); 
	}
	
}