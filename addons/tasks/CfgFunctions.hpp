class CfgFunctions {
    class coopr {
        class coopr_tasks_functions {
            file = "x\coopr\addons\tasks\functions";
            class setupTasksModule {};
            class broadcastReconReports {};
            class convertReconReportsToTasks {};
            class createSniperteamTask {};
            class validateReport {};
            class countTask {};
            class strengthAccuracy {};
        }
        class coopr_tasks_helper {
            file = "x\coopr\addons\tasks\helper";
            class getMaxForStrength {};
            class getMinForStrength {};
        }
        class coopr_tasks_tests {
            file = "x\coopr\addons\tasks\tests";
            class tests_tasks_runSuite {};
            class tests_countTasks {};
            class tests_strengthAccuracy {};
            class tests_minMaxForStrength {};
        }
    }
}
