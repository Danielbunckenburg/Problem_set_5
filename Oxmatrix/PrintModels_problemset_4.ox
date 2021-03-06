#include <oxstd.oxh>
#import <packages/PcGive/pcgive_ects>
#import <packages/arfima/arfima>

// ------------------------------------------------
// Information:
//
// To use the PrintModels module
// Add the following 4 lines to import PrintModels
// ------------------------------------------------
#import <packages/PcGive/pcgive_ects>
#import <packages/PcGive/pcgive_garch>
#import <packages/arfima/arfima>
#import <PrintModels>

run_9()
{
// This program requires a licenced version of PcGive Professional.
	//--- Ox code for EQ(10)
	decl model = new PcGive();

	model.Load("C:\\Users\\Bruger\\OneDrive - University of Copenhagen\\Polit 2021\\Economics2\\Problemset_5\\Data\\ConsumptionData.in7");
	model.Deterministic(-1);

	model.Select("Y", {"du1", 0, 0});
	model.Select("X", {"Constant", 0, 0});
	model.Select("Y", {"du1", 1, 1});
	model.Select("X", {"u1", 1, 1});
	model.Select("X", {"Trend", 0, 0});
	model.SetSelSample(1974, 1, 2018, 3);
	model.SetMethod("OLS");
	model.Estimate();
	model.TestSummary();

	return model;
}

main()
  {
  // ----------------------------
  // Replace "run_1();" with
  //         "decl m1 = run_1();"
  // ----------------------------
  // run_1();
  // run_2();
  decl m9 = run_9();

  // ----------------------------
  // Use the PrintModels class by
  // adding the following lines.
  // ----------------------------
  decl printmodels = new PrintModels();       // Creates a new class object called "printmodels", which we use to print results of the estimated models we add in the next line.
  printmodels.AddModels(m9);             // Select models to print.
  printmodels.SetModelNames({"(OLS u)"});   // Set the model names in the table.
  printmodels.SetPrintFormat(FALSE,TRUE,4,3); // Print format: Use SE , use scientific notation, precision of estimates, precision of standard errors/t-values
  printmodels.PrintTable();                   // Produce tex-table.

  // ------------------------------
  // Delete everything from memory.
  // ------------------------------
  delete m9;
  delete printmodels;
  }
