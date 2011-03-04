require 'xml/xslt'

class Open311::Xml2Json
  def transform   
    files = [
      "#{File.dirname(__FILE__)}/../../samples/xml/services.xml",
      "#{File.dirname(__FILE__)}/../../samples/xml/service-definition.xml",
      "#{File.dirname(__FILE__)}/../../samples/xml/service-definition-fix.xml",
      "#{File.dirname(__FILE__)}/../../samples/xml/service-requests.xml",
      "#{File.dirname(__FILE__)}/../../samples/xml/service-request.xml",
    ]
    
    xslt = XML::XSLT.new()
    xslt.xsl = "#{File.dirname(__FILE__)}/../../parker/xml2json.xslt"
    
    for file in files do
      puts "Transforming #{file}"
      xslt.xml = file
      out = xslt.serve()
      xslt.save(file.gsub('xml', 'json'))
      puts out
    end
  end
end
