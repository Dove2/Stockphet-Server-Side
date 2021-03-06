import MySQLProvider
import FluentProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [Row.self, JSON.self, Node.self]

        try setupProviders()
        try setupPreparations()
    }
    
    /// Configure providers
    private func setupProviders() throws {
//        MySQLDriver.Driver()
        try addProvider(FluentProvider.Provider.self)
        try addProvider(MySQLProvider.Provider.self)
    }
    
    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
        preparations.append(DailyStock.self)
        preparations.append(DailyBlock.self)
        preparations.append(DailyIndex.self)
        preparations.append(DailyRecommendation.self)
        preparations.append(CurrentIndexSz.self)
        preparations.append(CurrentIndexSh.self)
    }
}
