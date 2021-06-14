
// read / create / fill in the document
Handle(TDocStd_Document) theXdeDoc; // created in advance

RWObj_CafReader aReader;
aReader.SetSystemLengthUnit (0.001); // use mm as system units
aReader.SetFileLengthUnit (1.0); // meters for these sample files
aReader.SetDocument (theXdeDoc);
if (!aReader.Perform ("HDU_lowRez_part1.obj", Message_ProgressRange()))
{
  // reading error
}








