import XCTest
import MetalPetal
@testable import MPFilters

final class MPVibranceFilterTests: XCTestCase {
    
    func testApplyFilter_withValidImage() {
        // Arrange
        guard let testImage = loadTestImage(named: "example") else {
            XCTFail("Test image not found")
            return
        }
        
        let mtiImage = MTIImage(ciImage: CIImage(image: testImage)!, isOpaque: false).unpremultiplyingAlpha()
        let filter = MPVibranceFilter(amount: 1.0)
        
        // Act
        let outputImage = filter.apply(to: mtiImage)
        
        // Assert
        XCTAssertNotNil(outputImage, "Output image should not be nil after applying filter")
    }
    
    func testApplyFilter_withDifferentAmounts() {
        // Arrange
        guard let testImage = loadTestImage(named: "example") else {
            XCTFail("Test image not found")
            return
        }
        
        let mtiImage = MTIImage(ciImage: CIImage(image: testImage)!, isOpaque: false).unpremultiplyingAlpha()
        
        let filter1 = MPVibranceFilter(amount: 0.0)
        let filter2 = MPVibranceFilter(amount: 2.0)
        
        // Act
        let outputImage1 = filter1.apply(to: mtiImage)
        let outputImage2 = filter2.apply(to: mtiImage)
        
        // Assert
        XCTAssertNotNil(outputImage1, "Output image should not be nil with amount 0.0")
        XCTAssertNotNil(outputImage2, "Output image should not be nil with amount 2.0")
    }
    
    // Helper function to load test image from bundle
    func loadTestImage(named name: String) -> UIImage? {
        let bundle = Bundle.module
        guard let url = bundle.url(forResource: name, withExtension: "jpg"),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}
