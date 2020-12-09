$(document).ready(function () {
	var companies = $("body").attr("data-companies").slice(1,-1).split(", ");
    var compCounts = $("body").attr("data-compCounts").slice(1,-1).split(", ");
    var industriesByApps = $("body").attr("data-industriesByApps").slice(1,-1).split(", ");
    var industryByAppCounts = $("body").attr("data-industryByAppCounts").slice(1,-1).split(", ");
    var industriesByInters = $("body").attr("data-industriesByInters").slice(1,-1).split(", ");
    var industryByInterCounts = $("body").attr("data-industryByInterCounts").slice(1,-1).split(", ");
    
    
    var tcomp = document.getElementById('topCompanies').getContext('2d');
    var topC = new Chart(tcomp, {
        type: 'horizontalBar',
        data: {
            labels: companies,
            datasets: [{
                label: 'Number of Applications',
                data: compCounts,
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    var appsByInd = document.getElementById('appsByInd').getContext('2d');
    var ind = new Chart(appsByInd, {
        type: 'doughnut',
        data: {
            labels: industriesByApps,
            datasets: [{
                label: 'Number of Applications',
                data: industryByAppCounts,
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        }
    });

    var intByInd = document.getElementById('intByInd').getContext('2d');
    var int = new Chart(intByInd, {
        type: 'doughnut',
        data: {
            labels: industriesByInters,
            datasets: [{
                label: 'Number of Interviews',
                data: industryByInterCounts,
                backgroundColor: [
                    'rgba(0, 18, 68, 0.5)',
                    'rgba(176, 202, 109, 0.5)',
                    'rgba(0, 80, 134, 0.5)',
                    'rgba(49, 143, 181, 0.5)',
                    'rgba(247, 214, 191, 0.5)'
                ],
                borderColor: [
                    'rgba(0, 18, 68, 1)',
                    'rgba(176, 202, 109, 1)',
                    'rgba(0, 80, 134, 1)',
                    'rgba(49, 143, 181, 1)',
                    'rgba(247, 214, 191, 1)'
                ],
                borderWidth: 1
            }]
        }
    });  
});

